    function [TENSOR] = mass_tensor(order,weights,nodes,vertex)
    % Calculate Tensor Entries
    for i1 = 1:order+1
        for i2 =1:order+1
            for j1 =1:order+1
                for j2 = 1:order+1
                    sum = 0;
                    for k = 1:order+1
                        sum_inner = 0;
                        for l=1:order+1
                            sum_inner = sum_inner + eval_lagrange(i2, nodes(l), vertex) * eval_lagrange(j2, nodes(l), vertex) * weights(l);
                        end
                        sum = sum + sum_inner * (weights(k) * eval_lagrange(i1, nodes(k), vertex) * eval_lagrange(j1, nodes(k), vertex));
                    end
                    TENSOR(i1,i2,j1,j2) = sum;
                end
            end
        end
    end
end