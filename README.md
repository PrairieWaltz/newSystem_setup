# Configuration Setup Script

Do you spin up a lot of Linux machines for testing but want a quick way to reset some Bash, ZSH, and Tmux configurations?

This simple script will clone the file repository at [https://github.com/PrairieWaltz/confVault](https://github.com/PrairieWaltz/confVault) and take care of everything for you in a jiffy!

All files can be edited to easily fit your specific needs. Feel free to change at will!

---

## Features

- Automatically sets up Bash, ZSH, and Tmux configurations.
- Clone and run without manual adjustments.
- Easily customizable to suit your workflow.

---

## Installation and Usage

Follow these steps to use the script:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/PrairieWaltz/confVault
2. **Navigate to the cloned directory**:
3. ```bash
   cd confVault
4. **Run the setup script**:
5. ```bash
   ./setup.sh
6. **Enjoy your reset configurations!**

   ---

## Editing For Your Needs

1. **Open the configuration files (e.g., .bashrc, .zshrc, .tmux.conf) in the confVault directory using your preferred text editor**:
   ```bash
   nano/vim/mousepad .bashrc
2. **Make any changes you like to customize the setup**
3. **Save the files and re-run the script if needed**:
   ```bash
   ./setup.sh

  ---

## Requirements

- Git must be installed on your system
- A Linux environment capable of running Bash scripts

## Contributing

  Feel free to fork this repository and submit a pull request with any improvements or features you think would be useful!
