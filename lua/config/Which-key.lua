--which-key
lvim.builtin.which_key.setup.plugins.presets =
{
  operators = false,    -- adds help for operators like d, y, ...
  motions = false,      -- adds help for motions
  text_objects = false, -- help for text objects triggered after entering an operator
  windows = false,      -- default bindings on <c-w>
  nav = false,          -- misc bindings to work with windows
  z = true,             -- bindings for folds, spelling and others prefixed with z
  g = true,             -- bindings for prefixed with g
}
lvim.builtin.which_key.setup.ignore_missing = true
