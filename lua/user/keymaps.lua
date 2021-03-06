local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local opts2 = { noremap = true, silent = false }

keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

keymap("n", "n", "h", opts)
keymap("x", "n", "h", opts)
keymap("o", "n", "h", opts)
keymap("n", "e", "j", opts)
keymap("x", "e", "j", opts)
keymap("o", "e", "j", opts)
keymap("n", "u", "k", opts)
keymap("x", "u", "k", opts)
keymap("o", "u", "k", opts)
keymap("n", "i", "l", opts)
keymap("x", "i", "l", opts)
keymap("o", "i", "l", opts)
keymap("n", "l", "u", opts)
keymap("x", "l", "u", opts)
keymap("o", "l", "u", opts)
keymap("n", "k", "i", opts)
keymap("x", "k", "i", opts)
keymap("o", "k", "i", opts)
keymap("n", "K", "I", opts)
keymap("x", "K", "I", opts)
keymap("n", "h", "e", opts)
keymap("x", "h", "e", opts)
keymap("o", "h", "e", opts)
keymap("n", "H", "E", opts)
keymap("x", "H", "E", opts)
keymap("o", "H", "E", opts)
keymap("n", "=", "nzz", opts)
keymap("x", "=", "nzz", opts)
keymap("n", "-", "Nzz", opts)
keymap("x", "-", "Nzz", opts)

keymap("n", "N", "^", opts)
keymap("x", "N", "^", opts)
keymap("o", "N", "^", opts)
keymap("n", "I", "$", opts)
keymap("x", "I", "$h", opts)
keymap("o", "I", "$h", opts)
keymap("n", "W", "5w", opts)
keymap("x", "W", "5w", opts)
keymap("n", "B", "5b", opts)
keymap("x", "B", "5b", opts)
keymap("n", ">", ">>", opts)
keymap("n", "<", "<<", opts)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("n", "`", "~", opts)
keymap("x", "`", "~", opts)
keymap("n", ";", ":", opts2)
keymap("x", ";", ":", opts2)
keymap("n", "<C-u>", "<C-b>", opts)
keymap("n", "<C-e>", "<C-f>", opts)
keymap("x", "<C-u>", "<C-b>", opts)
keymap("x", "<C-e>", "<C-f>", opts)
keymap("c", "<C-u>", "<Up>", opts)
keymap("c", "<C-e>", "<Down>", opts)
keymap("n", "q", ":q<cr>", opts)
keymap("n", "Q", "q", opts)
keymap("n", "S", ":w<cr>", opts)
keymap("n", "ZZ", ":lua require('user.utils').SaveAndExit()<cr>", opts)
keymap("n", "st", ":%s//g<Left><Left>", opts2)
keymap("x", "st", ":s//g<Left><Left>", opts2)
keymap("n", "sd", ":cd ", opts2)
keymap("n", "sp", ":set spell!<cr>", opts)
keymap("n", "<A-y>", ":m .+1<cr>==", opts)
keymap("n", "<A-l>", ":m .-2<cr>==", opts)
keymap("v", "<A-y>", ":m '>+1<cr>gv-gv", opts)
keymap("v", "<A-l>", ":m '>-2<cr>gv-gv", opts)
keymap("n", "<leader>v", "^v$h", opts)
keymap("n", "<Esc>", ":noh<cr>", opts)

keymap("n", "s", "<nop>", opts)
keymap("n", "sN", ":set nosplitright<cr>:vsplit<cr>", opts)
keymap("n", "sE", ":set splitbelow<cr>:split<cr>", opts)
keymap("n", "sU", ":set nosplitbelow<cr>:split<cr>", opts)
keymap("n", "sI", ":set splitright<cr>:vsplit<cr>", opts)
keymap("n", "sn", "<C-w>h", opts)
keymap("n", "se", "<C-w>j", opts)
keymap("n", "su", "<C-w>k", opts)
keymap("n", "si", "<C-w>l", opts)
keymap("n", "<Up>", ":resize +5<cr>", opts)
keymap("n", "<Down>", ":resize -5<cr>", opts)
keymap("n", "<Left>", ":vertical resize -5<cr>", opts)
keymap("n", "<Right>", ":vertical resize +5<cr>", opts)
keymap("n", "sh", "<C-w>t<C-w>K", opts)
keymap("n", "sv", "<C-w>t<C-w>H", opts)
keymap("n", "srh", "<C-w>b<C-w>K", opts)
keymap("n", "srv", "<C-w>b<C-w>H", opts)
keymap("n", "sf", "<C-w>w", opts)
keymap("n", "sc", "<C-w>o", opts)
keymap("n", "sq", "<C-w>w:q<cr>", opts)
keymap("n", "ss", ":tabe<cr>", opts)

keymap("n", "<C-l>", ":BufferLineCyclePrev<cr>", opts)
keymap("n", "<C-y>", ":BufferLineCycleNext<cr>", opts)
keymap("n", "<leader>c", "<cmd>lua require('Comment.api').toggle_current_linewise()<cr>", opts)
keymap("v", "<leader>c", "<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
keymap('v', '<leader>f', "<ESC><cmd>lua vim.lsp.buf.range_formatting()<cr>", opts)
keymap('n', 'L', "<cmd>UndotreeToggle<cr>", opts)
keymap("n", "<leader>r", "<cmd>RnvimrToggle<cr>", opts)


keymap("n", "<A-o>", "<cmd>ClangdSwitchSourceHeader<cr>", opts)
keymap("n", "<leader>u", "<cmd>Trouble lsp_references<cr>", opts)

-- debug
-- keymap("n", "<leader>dr", "lua require'dap'.repl.open()<cr>", opts)
keymap("n", "<F9>", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap('n', '<F10>', '<cmd>lua require"user.dap.dap-util".reload_continue()<cr>', opts)
keymap("n", "<F4>", "<cmd>lua require'dap'.terminate()<cr>", opts)
keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<F6>", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<F7>", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<F8>", "<cmd>lua require'dap'.step_out()<cr>", opts)
-- keymap("n", "K", "<cmd>lua require'dapui'.eval()<cr>", opts)
-- keymap("n", "<leader>dt", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- git diff view
--keymap('n', '<leader>e', ']c', opts)
--keymap('n', '<leader>u', '[c', opts)

-- spell check
vim.cmd(
[[
  nnoremap <leader>s :call search('\w\>', 'c')<cr>a<C-X><C-S>
]])

-- gtags
-- find functions calling this function
keymap("n", "<leader>U", ":lua require('user.utils').GtagsRefernce()<cr>", opts)
-- find definition
keymap("n", "<leader>T", ":lua require('user.utils').GtagsText()<cr>", opts)

keymap("n", "[q", "2k", opts)
keymap("n", "[w", "3k", opts)
keymap("n", "[f", "4k", opts)
keymap("n", "[p", "5k", opts)
keymap("n", "[g", "6k", opts)
keymap("n", "[n", "7k", opts)
keymap("n", "[e", "8k", opts)
keymap("n", "[i", "9k", opts)
keymap("n", "[ao", "10k", opts)
keymap("n", "[aa", "11k", opts)
keymap("n", "[ar", "12k", opts)
keymap("n", "[as", "13k", opts)
keymap("n", "[at", "14k", opts)
keymap("n", "[ad", "15k", opts)
keymap("n", "[ah", "16k", opts)
keymap("n", "[an", "17k", opts)
keymap("n", "[ae", "18k", opts)
keymap("n", "[ai", "19k", opts)
keymap("n", "[ro", "20k", opts)
keymap("n", "[ra", "21k", opts)
keymap("n", "[rr", "22k", opts)
keymap("n", "[rs", "23k", opts)
keymap("n", "[rt", "24k", opts)
keymap("n", "[rd", "25k", opts)
keymap("n", "[rh", "26k", opts)
keymap("n", "[rn", "27k", opts)
keymap("n", "[re", "28k", opts)
keymap("n", "[ri", "29k", opts)
keymap("n", "[so", "30k", opts)
keymap("n", "[sa", "31k", opts)
keymap("n", "[sr", "32k", opts)
keymap("n", "[ss", "33k", opts)
keymap("n", "[st", "34k", opts)
keymap("n", "[sd", "35k", opts)
keymap("n", "[sh", "36k", opts)
keymap("n", "[sn", "37k", opts)
keymap("n", "[se", "38k", opts)
keymap("n", "[si", "39k", opts)
keymap("n", "[to", "40k", opts)
keymap("n", "[ta", "41k", opts)
keymap("n", "[tr", "42k", opts)
keymap("n", "[ts", "43k", opts)
keymap("n", "[tt", "44k", opts)
keymap("n", "[td", "45k", opts)
keymap("n", "[th", "46k", opts)
keymap("n", "[tn", "47k", opts)
keymap("n", "[te", "48k", opts)
keymap("n", "[ti", "49k", opts)
keymap("n", "[do", "50k", opts)
keymap("n", "[da", "51k", opts)
keymap("n", "[dr", "52k", opts)
keymap("n", "[ds", "53k", opts)
keymap("n", "[dt", "54k", opts)
keymap("n", "[dd", "55k", opts)
keymap("n", "[dh", "56k", opts)
keymap("n", "[dn", "57k", opts)
keymap("n", "[de", "58k", opts)
keymap("n", "[di", "59k", opts)
keymap("n", "[ho", "60k", opts)
keymap("n", "[ha", "61k", opts)
keymap("n", "[hr", "62k", opts)
keymap("n", "[hs", "63k", opts)
keymap("n", "[ht", "64k", opts)
keymap("n", "[hd", "65k", opts)
keymap("n", "[hh", "66k", opts)
keymap("n", "[hn", "67k", opts)
keymap("n", "[he", "68k", opts)
keymap("n", "[hi", "69k", opts)

keymap("n", "'q", "2j", opts)
keymap("n", "'w", "3j", opts)
keymap("n", "'f", "4j", opts)
keymap("n", "'p", "5j", opts)
keymap("n", "'g", "6j", opts)
keymap("n", "'n", "7j", opts)
keymap("n", "'e", "8j", opts)
keymap("n", "'i", "9j", opts)
keymap("n", "'ao", "10j", opts)
keymap("n", "'aa", "11j", opts)
keymap("n", "'ar", "12j", opts)
keymap("n", "'as", "13j", opts)
keymap("n", "'at", "14j", opts)
keymap("n", "'ad", "15j", opts)
keymap("n", "'ah", "16j", opts)
keymap("n", "'an", "17j", opts)
keymap("n", "'ae", "18j", opts)
keymap("n", "'ai", "19j", opts)
keymap("n", "'ro", "20j", opts)
keymap("n", "'ra", "21j", opts)
keymap("n", "'rr", "22j", opts)
keymap("n", "'rs", "23j", opts)
keymap("n", "'rt", "24j", opts)
keymap("n", "'rd", "25j", opts)
keymap("n", "'rh", "26j", opts)
keymap("n", "'rn", "27j", opts)
keymap("n", "'re", "28j", opts)
keymap("n", "'ri", "29j", opts)
keymap("n", "'so", "30j", opts)
keymap("n", "'sa", "31j", opts)
keymap("n", "'sr", "32j", opts)
keymap("n", "'ss", "33j", opts)
keymap("n", "'st", "34j", opts)
keymap("n", "'sd", "35j", opts)
keymap("n", "'sh", "36j", opts)
keymap("n", "'sn", "37j", opts)
keymap("n", "'se", "38j", opts)
keymap("n", "'si", "39j", opts)
keymap("n", "'to", "40j", opts)
keymap("n", "'ta", "41j", opts)
keymap("n", "'tr", "42j", opts)
keymap("n", "'ts", "43j", opts)
keymap("n", "'tt", "44j", opts)
keymap("n", "'td", "45j", opts)
keymap("n", "'th", "46j", opts)
keymap("n", "'tn", "47j", opts)
keymap("n", "'te", "48j", opts)
keymap("n", "'ti", "49j", opts)
keymap("n", "'do", "50j", opts)
keymap("n", "'da", "51j", opts)
keymap("n", "'dr", "52j", opts)
keymap("n", "'ds", "53j", opts)
keymap("n", "'dt", "54j", opts)
keymap("n", "'dd", "55j", opts)
keymap("n", "'dh", "56j", opts)
keymap("n", "'dn", "57j", opts)
keymap("n", "'de", "58j", opts)
keymap("n", "'di", "59j", opts)
keymap("n", "'ho", "60j", opts)
keymap("n", "'ha", "61j", opts)
keymap("n", "'hr", "62j", opts)
keymap("n", "'hs", "63j", opts)
keymap("n", "'ht", "64j", opts)
keymap("n", "'hd", "65j", opts)
keymap("n", "'hh", "66j", opts)
keymap("n", "'hn", "67j", opts)
keymap("n", "'he", "68j", opts)
keymap("n", "'hi", "69j", opts)

keymap("v", "[q", "2k", opts)
keymap("v", "[w", "3k", opts)
keymap("v", "[f", "4k", opts)
keymap("v", "[p", "5k", opts)
keymap("v", "[g", "6k", opts)
keymap("v", "[n", "7k", opts)
keymap("v", "[e", "8k", opts)
keymap("v", "[i", "9k", opts)
keymap("v", "[ao", "10k", opts)
keymap("v", "[aa", "11k", opts)
keymap("v", "[ar", "12k", opts)
keymap("v", "[as", "13k", opts)
keymap("v", "[at", "14k", opts)
keymap("v", "[ad", "15k", opts)
keymap("v", "[ah", "16k", opts)
keymap("v", "[an", "17k", opts)
keymap("v", "[ae", "18k", opts)
keymap("v", "[ai", "19k", opts)
keymap("v", "[ro", "20k", opts)
keymap("v", "[ra", "21k", opts)
keymap("v", "[rr", "22k", opts)
keymap("v", "[rs", "23k", opts)
keymap("v", "[rt", "24k", opts)
keymap("v", "[rd", "25k", opts)
keymap("v", "[rh", "26k", opts)
keymap("v", "[rn", "27k", opts)
keymap("v", "[re", "28k", opts)
keymap("v", "[ri", "29k", opts)
keymap("v", "[so", "30k", opts)
keymap("v", "[sa", "31k", opts)
keymap("v", "[sr", "32k", opts)
keymap("v", "[ss", "33k", opts)
keymap("v", "[st", "34k", opts)
keymap("v", "[sd", "35k", opts)
keymap("v", "[sh", "36k", opts)
keymap("v", "[sn", "37k", opts)
keymap("v", "[se", "38k", opts)
keymap("v", "[si", "39k", opts)
keymap("v", "[to", "40k", opts)
keymap("v", "[ta", "41k", opts)
keymap("v", "[tr", "42k", opts)
keymap("v", "[ts", "43k", opts)
keymap("v", "[tt", "44k", opts)
keymap("v", "[td", "45k", opts)
keymap("v", "[th", "46k", opts)
keymap("v", "[tn", "47k", opts)
keymap("v", "[te", "48k", opts)
keymap("v", "[ti", "49k", opts)
keymap("v", "[do", "50k", opts)
keymap("v", "[da", "51k", opts)
keymap("v", "[dr", "52k", opts)
keymap("v", "[ds", "53k", opts)
keymap("v", "[dt", "54k", opts)
keymap("v", "[dd", "55k", opts)
keymap("v", "[dh", "56k", opts)
keymap("v", "[dn", "57k", opts)
keymap("v", "[de", "58k", opts)
keymap("v", "[di", "59k", opts)
keymap("v", "[ho", "60k", opts)
keymap("v", "[ha", "61k", opts)
keymap("v", "[hr", "62k", opts)
keymap("v", "[hs", "63k", opts)
keymap("v", "[ht", "64k", opts)
keymap("v", "[hd", "65k", opts)
keymap("v", "[hh", "66k", opts)
keymap("v", "[hn", "67k", opts)
keymap("v", "[he", "68k", opts)
keymap("v", "[hi", "69k", opts)

keymap("v", "'q", "2j", opts)
keymap("v", "'w", "3j", opts)
keymap("v", "'f", "4j", opts)
keymap("v", "'p", "5j", opts)
keymap("v", "'g", "6j", opts)
keymap("v", "'n", "7j", opts)
keymap("v", "'e", "8j", opts)
keymap("v", "'i", "9j", opts)
keymap("v", "'ao", "10j", opts)
keymap("v", "'aa", "11j", opts)
keymap("v", "'ar", "12j", opts)
keymap("v", "'as", "13j", opts)
keymap("v", "'at", "14j", opts)
keymap("v", "'ad", "15j", opts)
keymap("v", "'ah", "16j", opts)
keymap("v", "'an", "17j", opts)
keymap("v", "'ae", "18j", opts)
keymap("v", "'ai", "19j", opts)
keymap("v", "'ro", "20j", opts)
keymap("v", "'ra", "21j", opts)
keymap("v", "'rr", "22j", opts)
keymap("v", "'rs", "23j", opts)
keymap("v", "'rt", "24j", opts)
keymap("v", "'rd", "25j", opts)
keymap("v", "'rh", "26j", opts)
keymap("v", "'rn", "27j", opts)
keymap("v", "'re", "28j", opts)
keymap("v", "'ri", "29j", opts)
keymap("v", "'so", "30j", opts)
keymap("v", "'sa", "31j", opts)
keymap("v", "'sr", "32j", opts)
keymap("v", "'ss", "33j", opts)
keymap("v", "'st", "34j", opts)
keymap("v", "'sd", "35j", opts)
keymap("v", "'sh", "36j", opts)
keymap("v", "'sn", "37j", opts)
keymap("v", "'se", "38j", opts)
keymap("v", "'si", "39j", opts)
keymap("v", "'to", "40j", opts)
keymap("v", "'ta", "41j", opts)
keymap("v", "'tr", "42j", opts)
keymap("v", "'ts", "43j", opts)
keymap("v", "'tt", "44j", opts)
keymap("v", "'td", "45j", opts)
keymap("v", "'th", "46j", opts)
keymap("v", "'tn", "47j", opts)
keymap("v", "'te", "48j", opts)
keymap("v", "'ti", "49j", opts)
keymap("v", "'do", "50j", opts)
keymap("v", "'da", "51j", opts)
keymap("v", "'dr", "52j", opts)
keymap("v", "'ds", "53j", opts)
keymap("v", "'dt", "54j", opts)
keymap("v", "'dd", "55j", opts)
keymap("v", "'dh", "56j", opts)
keymap("v", "'dn", "57j", opts)
keymap("v", "'de", "58j", opts)
keymap("v", "'di", "59j", opts)
keymap("v", "'ho", "60j", opts)
keymap("v", "'ha", "61j", opts)
keymap("v", "'hr", "62j", opts)
keymap("v", "'hs", "63j", opts)
keymap("v", "'ht", "64j", opts)
keymap("v", "'hd", "65j", opts)
keymap("v", "'hh", "66j", opts)
keymap("v", "'hn", "67j", opts)
keymap("v", "'he", "68j", opts)
keymap("v", "'hi", "69j", opts)

keymap("o", "[q", "2k", opts)
keymap("o", "[w", "3k", opts)
keymap("o", "[f", "4k", opts)
keymap("o", "[p", "5k", opts)
keymap("o", "[g", "6k", opts)
keymap("o", "[n", "7k", opts)
keymap("o", "[e", "8k", opts)
keymap("o", "[i", "9k", opts)
keymap("o", "[ao", "10k", opts)
keymap("o", "[aa", "11k", opts)
keymap("o", "[ar", "12k", opts)
keymap("o", "[as", "13k", opts)
keymap("o", "[at", "14k", opts)
keymap("o", "[ad", "15k", opts)
keymap("o", "[ah", "16k", opts)
keymap("o", "[an", "17k", opts)
keymap("o", "[ae", "18k", opts)
keymap("o", "[ai", "19k", opts)
keymap("o", "[ro", "20k", opts)
keymap("o", "[ra", "21k", opts)
keymap("o", "[rr", "22k", opts)
keymap("o", "[rs", "23k", opts)
keymap("o", "[rt", "24k", opts)
keymap("o", "[rd", "25k", opts)
keymap("o", "[rh", "26k", opts)
keymap("o", "[rn", "27k", opts)
keymap("o", "[re", "28k", opts)
keymap("o", "[ri", "29k", opts)
keymap("o", "[so", "30k", opts)
keymap("o", "[sa", "31k", opts)
keymap("o", "[sr", "32k", opts)
keymap("o", "[ss", "33k", opts)
keymap("o", "[st", "34k", opts)
keymap("o", "[sd", "35k", opts)
keymap("o", "[sh", "36k", opts)
keymap("o", "[sn", "37k", opts)
keymap("o", "[se", "38k", opts)
keymap("o", "[si", "39k", opts)
keymap("o", "[to", "40k", opts)
keymap("o", "[ta", "41k", opts)
keymap("o", "[tr", "42k", opts)
keymap("o", "[ts", "43k", opts)
keymap("o", "[tt", "44k", opts)
keymap("o", "[td", "45k", opts)
keymap("o", "[th", "46k", opts)
keymap("o", "[tn", "47k", opts)
keymap("o", "[te", "48k", opts)
keymap("o", "[ti", "49k", opts)
keymap("o", "[do", "50k", opts)
keymap("o", "[da", "51k", opts)
keymap("o", "[dr", "52k", opts)
keymap("o", "[ds", "53k", opts)
keymap("o", "[dt", "54k", opts)
keymap("o", "[dd", "55k", opts)
keymap("o", "[dh", "56k", opts)
keymap("o", "[dn", "57k", opts)
keymap("o", "[de", "58k", opts)
keymap("o", "[di", "59k", opts)
keymap("o", "[ho", "60k", opts)
keymap("o", "[ha", "61k", opts)
keymap("o", "[hr", "62k", opts)
keymap("o", "[hs", "63k", opts)
keymap("o", "[ht", "64k", opts)
keymap("o", "[hd", "65k", opts)
keymap("o", "[hh", "66k", opts)
keymap("o", "[hn", "67k", opts)
keymap("o", "[he", "68k", opts)
keymap("o", "[hi", "69k", opts)

keymap("o", "'q", "2j", opts)
keymap("o", "'w", "3j", opts)
keymap("o", "'f", "4j", opts)
keymap("o", "'p", "5j", opts)
keymap("o", "'g", "6j", opts)
keymap("o", "'n", "7j", opts)
keymap("o", "'e", "8j", opts)
keymap("o", "'i", "9j", opts)
keymap("o", "'ao", "10j", opts)
keymap("o", "'aa", "11j", opts)
keymap("o", "'ar", "12j", opts)
keymap("o", "'as", "13j", opts)
keymap("o", "'at", "14j", opts)
keymap("o", "'ad", "15j", opts)
keymap("o", "'ah", "16j", opts)
keymap("o", "'an", "17j", opts)
keymap("o", "'ae", "18j", opts)
keymap("o", "'ai", "19j", opts)
keymap("o", "'ro", "20j", opts)
keymap("o", "'ra", "21j", opts)
keymap("o", "'rr", "22j", opts)
keymap("o", "'rs", "23j", opts)
keymap("o", "'rt", "24j", opts)
keymap("o", "'rd", "25j", opts)
keymap("o", "'rh", "26j", opts)
keymap("o", "'rn", "27j", opts)
keymap("o", "'re", "28j", opts)
keymap("o", "'ri", "29j", opts)
keymap("o", "'so", "30j", opts)
keymap("o", "'sa", "31j", opts)
keymap("o", "'sr", "32j", opts)
keymap("o", "'ss", "33j", opts)
keymap("o", "'st", "34j", opts)
keymap("o", "'sd", "35j", opts)
keymap("o", "'sh", "36j", opts)
keymap("o", "'sn", "37j", opts)
keymap("o", "'se", "38j", opts)
keymap("o", "'si", "39j", opts)
keymap("o", "'to", "40j", opts)
keymap("o", "'ta", "41j", opts)
keymap("o", "'tr", "42j", opts)
keymap("o", "'ts", "43j", opts)
keymap("o", "'tt", "44j", opts)
keymap("o", "'td", "45j", opts)
keymap("o", "'th", "46j", opts)
keymap("o", "'tn", "47j", opts)
keymap("o", "'te", "48j", opts)
keymap("o", "'ti", "49j", opts)
keymap("o", "'do", "50j", opts)
keymap("o", "'da", "51j", opts)
keymap("o", "'dr", "52j", opts)
keymap("o", "'ds", "53j", opts)
keymap("o", "'dt", "54j", opts)
keymap("o", "'dd", "55j", opts)
keymap("o", "'dh", "56j", opts)
keymap("o", "'dn", "57j", opts)
keymap("o", "'de", "58j", opts)
keymap("o", "'di", "59j", opts)
keymap("o", "'ho", "60j", opts)
keymap("o", "'ha", "61j", opts)
keymap("o", "'hr", "62j", opts)
keymap("o", "'hs", "63j", opts)
keymap("o", "'ht", "64j", opts)
keymap("o", "'hd", "65j", opts)
keymap("o", "'hh", "66j", opts)
keymap("o", "'hn", "67j", opts)
keymap("o", "'he", "68j", opts)
keymap("o", "'hi", "69j", opts)
