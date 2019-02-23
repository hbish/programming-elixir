# me = self()

# The parallel map spawns a separate process, therefore the context for the self() process
# is no longer the parent but in fact its for the child process. 