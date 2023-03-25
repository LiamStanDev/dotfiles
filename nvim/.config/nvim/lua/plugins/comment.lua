local status, comment = pcall(require, "Comment")
if not status then
	print("Comment not found!")
	return
end

comment.setup(dofile)
