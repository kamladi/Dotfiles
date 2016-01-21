. ./utils.sh

e_header "Cleaning up..."

files=( ".aliases" ".bashrc" ".bash_profile" ".vim" ".vimrc" ".zshrc" ".zlogin" ".zlogout" ".zpreztorc" ".zprofile" ".zshenv" "z")
for file in "${files[@]}"; do
	path="${HOME}/${file}"
	if [[ -L $path ]]; then
		e_header "Unlinking ${path}"
		rm $path
	fi
done

e_success "Cleanup complete."
