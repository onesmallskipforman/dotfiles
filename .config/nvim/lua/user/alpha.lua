local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require "alpha.themes.dashboard"
-- dashboard.section.header.val = {
--   [[                               __                ]],
--   [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
--   [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
--   [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
--   [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
--   [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
-- }

dashboard.section.header.val = {
  [[   ooooo      ooo                     oooooo     oooo  o8o                      ]],
  [[   `888b.     `8'                      `888.     .8'   `"'                      ]],
  [[    8 `88b.    8   .ooooo.   .ooooo.    `888.   .8'   oooo  ooo. .oo.  .oo.     ]],
  [[    8   `88b.  8  d88' `88b d88' `88b    `888. .8'    `888  `888P"Y88bP"Y88b    ]],
  [[    8     `88b.8  888ooo888 888   888     `888.8'      888   888   888   888    ]],
  [[    8       `888  888    .o 888   888      `888'       888   888   888   888    ]],
  [[   o8o        `8  `Y8bod8P' `Y8bod8P'       `8'       o888o o888o o888o o888o   ]],
  [[                                                                                ]],
  [[                                                                                ]],
  [[                     ┌──────────────┐      ┌──────────────┐                     ]],
  [[ r(t)       e(t)     │              │u(t)  │              │ y(t)                ]],
  [[─────────►X─────────►│  Skipper's   ├─────►│   NeoVim     ├──────────┬─────────►]],
  [[          ▲          │              │      │              │          │          ]],
  [[          │          └──────────────┘      └──────────────┘          │          ]],
  [[          │                                                          │          ]],
  [[          │                                                          │          ]],
  [[          │                     ┌──────────────┐                     │          ]],
  [[          │              y_m(t) │              │                     │          ]],
  [[          └─────────────────────┤    Config    │◄────────────────────┘          ]],
  [[                                │              │                                ]],
  [[                                └──────────────┘                                ]],
  -- [[                                                                                ]],
  -- [[                  A NeoVim Config by Skipper, Controls Engineer                 ]]
}


dashboard.section.buttons.val = {
  dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
  dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("p", " " .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
  dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
  dashboard.button("c", " " .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
  dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}

local function footer()
  return "github.com/onesmallskipforman"

  -- -- local total_plugins = #vim.tbl_keys(packer_plugins)
  -- local version = vim.version()
  -- local nvim_version_info = "  Neovim v" .. version.major .. "." .. version.minor .. "." .. version.patch
  --
  -- -- return " " .. total_plugins .. " plugins" .. nvim_version_info
  -- return nvim_version_info
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl  = "Type"
dashboard.section.header.opts.hl  = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

-- require("alpha.term")
-- dashboard.section.terminal.command = "cat | lolcat --seed=27 " .. os.getenv("HOME") .. "/.config/nvim/init.lua"
-- dashboard.section.terminal.width = 69
-- dashboard.section.terminal.height = 8
--
-- -- dashboard.config.layout = {
-- --   { type = "padding", val = 2 },
-- --   dashboard.section.terminal,
-- --   { type = "padding", val = 2 },
-- --   dashboard.section.buttons,
-- --   dashboard.section.footer,
-- -- }
-- dashboard.config.layout = {
--   { type = "padding", val = 1 },
--   dashboard.section.terminal,
--   { type = "padding", val = 10 },
--   dashboard.section.buttons,
--   { type = "padding", val = 1 },
--   dashboard.section.footer,
-- }

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
