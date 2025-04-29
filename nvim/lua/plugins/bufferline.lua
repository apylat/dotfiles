return {
  'akinsho/bufferline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons', -- для іконок файлів
  config = function()
    require("bufferline").setup{
      options = {
        mode = "tabs", -- або "tabs", якщо хочеш саме таби
        separator_style = "slant", -- стиль розділювачів
        diagnostics = "nvim_lsp", -- показувати помилки від LSP
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true
          }
        }
      }
    }
  end
}
