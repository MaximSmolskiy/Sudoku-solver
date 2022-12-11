addpath(fullfile('..', '..', 'src'));

listing = dir(fullfile('..', 'data'));
for file = listing(~[listing.isdir])'

    load(fullfile(file.folder, file.name));

    grid = solve(initial_grid);

    assert(check(grid, initial_grid, is_correct));
end
