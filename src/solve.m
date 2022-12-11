function grid = solve(initial_grid)

    grid = optimvar('grid', [9, 9, 9], 'Type', 'integer', 'LowerBound', 0, 'UpperBound', 1);

    sudoku = optimproblem('Description', 'Sudoku');

    sudoku.Constraints.one_digit_per_cell = sum(grid, 3) == 1;

    sudoku.Constraints.all_digits_per_row = sum(grid, 2) == 1;
    sudoku.Constraints.all_digits_per_column = sum(grid, 1) == 1;

    all_digits_per_block = optimconstr([3, 3, 9]);
    for block_i = 1 : 3

        for block_j = 1 : 3

            start_row = 1 + 3 * (block_i - 1);
            end_row = start_row + 2;

            start_column = 1 + 3 * (block_j - 1);
            end_column = start_column + 2;

            all_digits_per_block(block_i, block_j, :) = sum(sum(grid(start_row : end_row, start_column : end_column, :))) == 1;
        end
    end
    sudoku.Constraints.all_digits_per_block = all_digits_per_block;

    [rows, columns, digits] = find(initial_grid);
    grid_indices = sub2ind([9, 9, 9], rows, columns, digits);
    sudoku.Constraints.initial_grid = grid(grid_indices) == 1;

    options = optimoptions('intlinprog', 'Display', 'off');
    solution = solve(sudoku, 'Options', options);

    grid = solution.grid;

    if isempty(grid)

        return;
    end

    [rows, columns_digits] = find(grid);
    [columns, digits] = ind2sub([9, 9], columns_digits);
    grid_indices = sub2ind([9, 9], rows, columns);

    grid = zeros([9, 9]);
    grid(grid_indices) = digits;
end
