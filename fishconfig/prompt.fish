function fish_prompt
	set -l ExitCode $status
	if test "$ExitCode" -eq 0
		set Face (set_color green)"=*'-'="(set_color normal)
	else
		set Face (set_color blue)"=*;-;="(set_color normal)
	end

	echo (whoami)@(hostname) (set_color $fish_color_cwd)(prompt_pwd)(set_color normal)
	echo -n $Face" < "
end

function fish_right_prompt
	__fish_vcs_prompt
end

