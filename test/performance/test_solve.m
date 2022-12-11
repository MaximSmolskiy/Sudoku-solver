addpath(fullfile('..', '..', 'src'));

%% empty.mat
load(fullfile('..', 'data', 'empty.mat'));
solve(initial_grid);

%% full.mat
load(fullfile('..', 'data', 'full.mat'));
solve(initial_grid);

%% random.mat
load(fullfile('..', 'data', 'random.mat'));
solve(initial_grid);

%% same_digits_per_block.mat
load(fullfile('..', 'data', 'same_digits_per_block.mat'));
solve(initial_grid);

%% same_digits_per_column.mat
load(fullfile('..', 'data', 'same_digits_per_column.mat'));
solve(initial_grid);

%% same_digits_per_row.mat
load(fullfile('..', 'data', 'same_digits_per_row.mat'));
solve(initial_grid);
