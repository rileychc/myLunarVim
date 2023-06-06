 local status_cmp_ok, cmp_types = pcall(require, "cmp.types.cmp")
  if not status_cmp_ok then
    return
  end
  local ConfirmBehavior = cmp_types.ConfirmBehavior
  local SelectBehavior = cmp_types.SelectBehavior

  local cmp_mapping = require "cmp.config.mapping"

lvim.builtin.cmp.mapping.cmp_mapping.preset.insert["<M-Space>"] = cmp_mapping.complete()

