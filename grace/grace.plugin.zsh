export umd_pass_file="${0:h}/grace/umd pass.txt"

alias grace="sshpass -f \"${umd_pass_file}\" ssh vchari@grace-new.umd.edu"
