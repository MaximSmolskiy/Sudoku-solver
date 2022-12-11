function result = check(grid, initial_grid, is_correct)

    if ~is_correct

        result = isempty(grid);
        return;
    end

    if isempty(grid)

        result = false;
        return;
    end

    result = true;

    result = result && isequal(sort(grid, 2), repmat(1 : 9, [9, 1]));

    result = result && isequal(sort(grid, 1), repmat((1 : 9)', [1, 9]));

    for block_i = 1 : 3

        for block_j = 1 : 3

            start_row = 1 + 3 * (block_i - 1);
            end_row = start_row + 2;

            start_column = 1 + 3 * (block_j - 1);
            end_column = start_column + 2;

            result = result && isempty(setdiff(1 : 9, grid(start_row : end_row, start_column : end_column)));
        end
    end

    grid_indices = find(initial_grid);
    result = result && isequal(grid(grid_indices), initial_grid(grid_indices));
end
