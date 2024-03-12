# sessFinder

Trying to check website session cookies by browser inspector manually? Well, it takes more time. Automate and save your time using this tool. sessFinder allows for efficient, bulk analysis of session cookies with a user-friendly, color-coded output, making it easier to spot security issues at a glance.

**sessFinder** is an Automated and lightweight command-line tool designed to help Bug Bounty Hunters and security researchers identify misconfigurations related to `HttpOnly` and `Secure` flags in web application sessions. By efficiently analyzing session cookies, `sessfinder` aids in pinpointing potential vulnerabilities that could lead to session hijacking or man-in-the-middle (MITM) attacks.

## Features
![Screenshot from 2024-03-12 00-53-08](https://github.com/H3LLKY4T/sessFinder/assets/141442170/ba3d5f64-de6a-4edf-a3cc-1eb2115b047f)


- Supports multiple URLs input through a file.
- Concurrent checks for faster analysis using GNU parallel.
- Color-coded output for quick identification of security misconfigurations.
- Only scans for common vulnerable session cookies (`PHPSESSID`, `ASP.NET_SessionId`, `JSESSIONID`).

## Installation
#### Requirements
**GNU Parallel Installation for Linux:**
For Debian-based distributions, GNU Parallel can be installed from the default repositories:
```
sudo apt-get update
sudo apt-get install parallel
```
To use `sessFinder`, clone this repository and ensure you have `GNU parallel` installed on your system.

```
git clone https://github.com/H3LLKY4T/sessFinder.git
cd sessFinder
chmod +x install.sh
./install.sh
```
To uninstall the program:
```
./install.sh --uninstall
```

## Usage
Before running sessFinder, make sure your input file (urls.txt) is formatted with one URL per line. Try to use Alive domains. 

To execute sessFinder:
```
sessFinder.sh -L urls.txt
```
## Options
- -L <file>: Specifies the path to the file containing the list of URLs to be checked.
- -h, --help: Displays the help message and exits.

## Contributing
Contributions to sessFinder are welcome! If you have suggestions for improvements or bug fixes, please feel free to:

- Fork the repository.
- Create a new branch for your feature (git checkout -b feature/AmazingFeature).
- Commit your changes (git commit -m 'Add some AmazingFeature').
- Push to the branch (git push origin feature/AmazingFeature).
- Open a pull request.
