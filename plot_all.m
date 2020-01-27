clear

list_species = {
'A.thaliana'
% 'C.elegans'
'D.melanogaster'
'E.coli'
'H.sapiens2'
'H.sapiens3'
'M.musculus'
'M.musculus2'
'M.musculus3'
% 'S.cerevisiae'
'S.cerevisiae2'
'S.cerevisiae3'
}

method = '_1s2ca';

% results_folder = 'test_search/fragger_results/';
results_folder = 'test_search/est_results/';

n = size(list_species, 1)
for i = 1:n
    species = list_species{i};
%     run parse_psm.m

    species_folder = [results_folder,species];
    
    load(['test_search/matdata/', species, '_data.mat'])
    load([species_folder, '/params/', method, '.mat'])

    if strcmp(method, '_1s2c')
        alpha = theta.alpha;
        u_c = theta.theta_c.u;
        sigma_c = theta.theta_c.sigma;
        lambda_c = theta.theta_c.lambda;
        u_i = theta.theta_i.u;
        sigma_i = theta.theta_i.sigma;
        lambda_i = theta.theta_i.lambda;
    elseif strcmp(method, '_1s2ca')
        alpha = theta.alpha;
        u_c = theta.theta_c.u;
        sigma_c = theta.theta_c.sigma;
        a_i = theta.theta_i.a;
        b_i = theta.theta_i.b;
        gamma_i = theta.theta_i.gamma;
    elseif strcmp(method, '_2s3ci') || strcmp(method, '_2s3ct')
        alpha = theta.alpha;
        beta = theta.beta;
        [u_c, sigma_c, lambda_c] = unpack_skntheta(theta.theta_c);
        [u_i, sigma_i, lambda_i] = unpack_skntheta(theta.theta_i);
        [u_i2, sigma_i2, lambda_i2] = unpack_skntheta(theta.theta_i2);
    end
    
    if strcmp(method, '_1s2ca')
        plot_dist_gamma
    else
        plot_dist
    end
end

