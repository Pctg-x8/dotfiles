if not type -q fisher
	# setup fisher
	curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end

fisher install edc/bass

