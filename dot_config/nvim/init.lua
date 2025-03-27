if vim.g.vscode then
  -- VSCode extension
  require('config.vs-code')

else

  require('config.options')
  require('config.keymaps')
  require('config.lazy')
  require('config.autocmds')

end
