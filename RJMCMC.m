N = 100000;
target_value = zeros(10,1);
start_value = zeros(10,1);
n_data = zeros(10,N);
ratio = zeros(10,1);

for i = 1:10
    m = 10;
    n0 = randi(10);
    target_value(i) = n0;
    k = 10;
    sigma_0 = 0.2;
    sigma_p = 0.3;
    sigma_r = 0.2;
    mu_b = 2 * ones(n0,1);
    b = mu_b + sigma_p * randn(n0,1);
    X = 5 * randn(k,m);
    y = X(:,1:n0)*b + sigma_0*randn(k,1);
    n_data(i,1) = randi(10);
    start_value(i) = n_data(i,1);
    b = zeros(m,N);
    b(1:n_data(1),1) = 2 * ones(n_data(1),1) + sigma_p * randn(n_data(1),1);
    P = ones(2,N);
    for k = 2:N
        number = randi(10);
        if number >= n_data(i,k-1)
            mu_big = zeros(1,number)';
            sigma_big = sigma_r * eye(number);
            U_big = mvnrnd(mu_big,sigma_big)';
            b_big = [b(1:n_data(i,k-1),k-1)' U_big(n_data(i,k-1)+1:number,1)']';
            prior_constant = 1/sqrt(2*pi*sigma_r^2)^n_data(i,k-1);
            posterior_constant =  1/sqrt(2*pi*sigma_r^2)^number;
            h1_big = posterior_constant * exp(-1 / (2*sigma_r^2) * norm(U_big)^2);
            h2_big = prior_constant * exp(-1/(2*sigma_r^2)*norm(U_big(1:n_data(i,k-1)))^2);
            E1 = 1 \ (2 * sigma_0^2) * norm(y - X(:,1:number)*b_big)^2;
            E2 = 1 \ (2 * sigma_0^2) * norm(y - X(:,1:n_data(i,k-1))*b(1:n_data(i,k-1),k-1))^2;
            constant_p = (2*pi*sigma_p^2)^((n_data(i,k-1)-number)/2);
            norm_posterior = norm(b_big - 2*ones(number,1))^2;
            norm_prior = norm(b(1:n_data(i,k-1),k-1) - 2*ones(n_data(i,k-1),1))^2;
            norm_diff = norm_posterior - norm_prior;
            func = exp(-1/(2*sigma_p^2) * norm_diff);
            P(1,k-1) = exp(-(E1-E2)) * constant_p * func * h2_big / h1_big;
            if rand(1) < min(P(:,k-1))
                n_data(i,k) = number;
                b(1:number,k) = b_big;
            else
                n_data(i,k) = n_data(i,k-1);
                b(1:n_data(i,k-1),k) = b(1:n_data(i,k-1),k-1);
            end
        else
            mu_small = zeros(1,number)';
            sigma_small = sigma_r * eye(number);
            U_small = mvnrnd(mu_small,sigma_small)';
            b_small = b(1:number,k-1) + U_small;
            U_orignal = [U_small' b(number+1:n_data(i,k-1),k-1)']';
            prior_constant = 1/sqrt(2*pi*sigma_r^2)^n_data(i,k-1);
            posterior_constant = 1/sqrt(2*pi*sigma_r^2)^number;
            h2_small = posterior_constant * exp(-1 / (2*sigma_r^2) * norm(U_orignal)^2);
            h1_small = prior_constant * exp(-1/(2*sigma_r^2)*norm(U_small)^2);
            E1 = 1 \ (2 * sigma_0^2) * norm(y - X(:,1:number)*b_small)^2;
            E2 = 1 \ (2 * sigma_0^2) * norm(y - X(:,1:n_data(i,k-1))*b(1:n_data(i,k-1),k-1))^2;
            constant_p = (2*pi*sigma_p^2)^((n_data(i,k-1)-number)/2);
            norm_posterior = norm(b_small - 2*ones(number,1))^2;
            norm_prior = norm(b(1:n_data(i,k-1),k-1) - 2*ones(n_data(i,k-1),1))^2;
            norm_diff = norm_posterior - norm_prior;
            func = exp(-1 / (2*sigma_p^2)*norm_diff);
            P(1,k-1) = exp(-(E1-E2)) * constant_p * func * h2_small / h1_small;
            if rand(1) < min(P(:,k-1))
               n_data(i,k) = number;
               b(1:number,k) = b_small;
            else
               n_data(i,k) = n_data(i,k-1);
               b(1:n_data(i,k-1),k) = b(1:n_data(i,k-1),k-1);
            end
        end
    end
    ratio(i) = sum(n_data(i,:) == target_value(i)) / N;
end