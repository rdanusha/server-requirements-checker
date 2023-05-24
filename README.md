# Version Checker
This shell script is a useful tool for checking and managing the versions of PHP, Node.js, NPM, and Composer on your system. It enables you to check the installed versions and conveniently configure the desired versions by editing the script file.

## Usage

1. Open a terminal or command prompt.

2. Navigate to the directory where the shell script is located.

```shell
cd /path/to/script/directory
```

3. Make sure the shell script has execution permissions. If not, grant the necessary permissions using the `chmod` command.

```shell
chmod +x version-checker.sh
```

4. Run the shell script.

```shell
./version-checker.sh
```

5. The script will display the currently installed versions and compare them with the desired versions specified within the script file. It will provide information on whether each version is up to date, outdated, or not installed.

6. If any of the versions are not installed or are outdated, the script will provide instructions on how to update or install them.

7. Follow the instructions provided by the script to update or install the necessary versions.

8. Once the script has finished executing, it will provide a summary of the version check results.

9. You can modify the desired versions by editing the shell script using a text editor.

10. To exit the script, simply close the terminal or press `Ctrl + C` if it is still running.

## License

This script is provided under the [MIT License](LICENSE).

Feel free to modify, distribute, and use it to suit your needs.

**Note:** This shell script assumes that the necessary dependencies (PHP, Node.js, NPM, and Composer) are already installed on your system. It does not perform any installations or updates itself, but rather provides guidance on how to manage the versions.
