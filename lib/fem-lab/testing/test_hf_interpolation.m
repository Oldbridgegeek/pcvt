function correct = test_hf_interpolation    % Test whether hf_interpolation delivers correct values by testing a special case.     % We will consider polynomial degree 1 and mesh size 0.5 and hardcode the solution for that case.    % correct will be a matrix, which will contain 0 and 1. If the entry is 0 at (i,j), it means the j-th shape function for the i-th element    % is not correct, otherwise it is correct.    % If all entries are 1 output instead of the whole matrix just a 1.                % ---- Hardcoded shape functions ----    % 1. Element    shape_function_1_hard = [1,-2,-2,4;0,2,0,-4;0,0,2,-4;0,0,0,4];    % 2. Element    shape_function_2_hard = [2,-2,-4,4;-1,2,2,-4;0,0,4,-4;0,0,-2,4];    % 3. Element    shape_function_3_hard = [2,-4,-2,4;0,4,0,-4;-1,2,2,-4;0,-2,0,4];    % 4. Element    shape_function_4_hard = [4,-4,-4,4;-2,4,2,-4;-2,2,4,-4;1,-2,-2,4];    % ------------------------------------        % ---- Generate shape functions by hf_interpolation ----    % 1. Element    shape_function_1 = zeros(4,4);    data_set = [0,0,1;0.5,0,0;0,0.5,0;0.5,0.5,0];    shape_function_1(1,:) = hf_interpolation(data_set);    data_set = [0,0,0;0.5,0,1;0,0.5,0;0.5,0.5,0];    shape_function_1(2,:) = hf_interpolation(data_set);    data_set = [0,0,0;0.5,0,0;0,0.5,1;0.5,0.5,0];    shape_function_1(3,:) = hf_interpolation(data_set);    data_set = [0,0,0;0.5,0,0;0,0.5,0;0.5,0.5,1];    shape_function_1(4,:) = hf_interpolation(data_set);    % 2. Element    shape_function_2 = zeros(4,4);    data_set = [0.5,0,1;1,0,0;0.5,0.5,0;1,0.5,0];    shape_function_2(1,:) = hf_interpolation(data_set);    data_set = [0.5,0,0;1,0,1;0.5,0.5,0;1,0.5,0];    shape_function_2(2,:) = hf_interpolation(data_set);    data_set = [0.5,0,0;1,0,0;0.5,0.5,1;1,0.5,0];    shape_function_2(3,:) = hf_interpolation(data_set);    data_set = [0.5,0,0;1,0,0;0.5,0.5,0;1,0.5,1];    shape_function_2(4,:) = hf_interpolation(data_set);    % 3. Element    shape_function_3 = zeros(4,4);    data_set = [0,0.5,1;0.5,0.5,0;0,1,0;0.5,1,0];    shape_function_3(1,:) = hf_interpolation(data_set);    data_set = [0,0.5,0;0.5,0.5,1;0,1,0;0.5,1,0];    shape_function_3(2,:) = hf_interpolation(data_set);    data_set = [0,0.5,0;0.5,0.5,0;0,1,1;0.5,1,0];    shape_function_3(3,:) = hf_interpolation(data_set);    data_set = [0,0.5,0;0.5,0.5,0;0,1,0;0.5,1,1];    shape_function_3(4,:) = hf_interpolation(data_set);    % 4. Element    shape_function_4 = zeros(4,4);    data_set = [0.5,0.5,1;1,0.5,0;0.5,1,0;1,1,0];    shape_function_4(1,:) = hf_interpolation(data_set);    data_set = [0.5,0.5,0;1,0.5,1;0.5,1,0;1,1,0];    shape_function_4(2,:) = hf_interpolation(data_set);    data_set = [0.5,0.5,0;1,0.5,0;0.5,1,1;1,1,0];    shape_function_4(3,:) = hf_interpolation(data_set);    data_set = [0.5,0.5,0;1,0.5,0;0.5,1,0;1,1,1];    shape_function_4(4,:) = hf_interpolation(data_set);    % -------------------------------------------------------    % ---- Test whether hardcoded solution equals to the generated solution -----    correct = zeros(4,4);    for i=1:4        if( shape_function_1(i,:) == shape_function_1_hard(i,:) )            correct(1,i) = 1;        endif        if( shape_function_2(i,:) == shape_function_2_hard(i,:) )            correct(2,i) = 1;        endif        if( shape_function_3(i,:) == shape_function_3_hard(i,:) )            correct(3,i) = 1;        endif        if( shape_function_4(i,:) == shape_function_4_hard(i,:) )            correct(4,i) = 1;        endif    endfor    % ---------------------------------------------------------------------------        % If every value is correct output 1 instead of whole matrix    test = 1;    for i=1:4        for j=1:4            if( correct(i,j) == 0 )                 test = 0;            endif        endfor    endfor    if ( test == 1 )        correct = 1;    endif        endfunction