-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder
  { import = "astrocommunity.pack.tailwindcss" }, --pacote tailwindcss
  { import = "astrocommunity.diagnostics.trouble-nvim"}, --pacote trouble para ver os erros
  { import = "astrocommunity.utility.hover-nvim" }, --pacote hover no elemento 
}
