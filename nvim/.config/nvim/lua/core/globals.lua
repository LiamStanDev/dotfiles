-- python provider
local conda_prefix = os.getenv("CONDA_PREFIX")
if conda_prefix ~= nil then
	vim.g.python_host_prog = conda_prefix .. "/bin/python"
	vim.g.python3_host_prog = conda_prefix .. "/bin/python"
else
	vim.g.python_host_prog = "/usr/bin/python"
	vim.g.python3_host_prog = "/usr/bin/python3"
end
