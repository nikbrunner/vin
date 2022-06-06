local pretty_fold_status_ok, pretty_fold = pcall(require, "pretty-fold")
if not pretty_fold_status_ok then
	return
end

local pretty_fold_preview_status_ok, pretty_fold_preview = pcall(require, "pretty-fold.preview")
if not pretty_fold_preview_status_ok then
	return
end

pretty_fold.setup()
pretty_fold_preview.setup()
