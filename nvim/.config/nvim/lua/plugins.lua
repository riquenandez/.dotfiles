return {
    'https://github.com/neovim/nvim-lspconfig',
    {
        'nvim-telescope/telescope.nvim', version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- optional but recommended
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        }
    },
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        branch = 'main',
        build = ':TSUpdate'
    },
    { "nvim-tree/nvim-web-devicons" }, 
    { "ThePrimeagen/harpoon" }, 
    {'mbbill/undotree'},
    {'tpope/vim-fugitive'},
    { 
        "rose-pine/neovim", 
        name = 'rose-pine', 
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    }
}
