# project-structure
This repo intends to store project's folder structures for many different languages and technologies 

# Project Status
This repository contains scripts and resources that are under development. 
Please note that some files, such as `setup_project.sh`, are not fully functional yet.
Use at your own discretion.

# Python Package Creation Study Project

**⚠️ Important Notice: This project is under development and should not be used in any production environment. It was created for the purpose of studying and experimenting with Python package creation.**

---

## Project Description

This repository contains scripts and resources for understanding and automating the creation of Python packages. The structure adheres to standard practices, but all contents are purely for educational purposes.

---

## Features
- Automated directory structure setup for a Python package.
- Example library (`core.py`) with a simple function.
- Basic test file (`test_core.py`) using `pytest`.
- Configuration for package distribution (`setup.py`).
- Documentation guidelines (`README.md`).

---

## Installation

This project is still in development. No installation is recommended at this stage.

---

## Usage

No usage instructions are provided, as the project is not finalized and may contain experimental or incomplete code.

---

## Contribution

This repository is open for learning purposes, but contributions are not currently being accepted as the project is under construction.

---

## License

This project is licensed under the MIT License. See the LICENSE file for details.

---

### Acknowledgment

This project is part of a personal study to better understand the process of building Python packages. It is not intended for production use or public distribution.

### Python Package Index (PyPI) Reference
![Image in Subfolder](images/logo-small.pypi1.svg) 

PyPI os a Python Package repository   

# How to Upload a Python Package to PyPI

Uploading a package to PyPI allows you to distribute your Python package to the public. Follow these steps:

---

## 1. Prepare Your Project
Make sure your project follows the structure of a Python package. For example:
```plaintext
my_package/
    ├── my_package/
    │   ├── __init__.py
    │   └── core.py
    ├── tests/
    │   └── test_core.py
    ├── setup.py
    └── README.md
```

---

## 2. Create a `setup.py` File
The `setup.py` file is essential for defining your package's metadata. Here’s an example:
```python
from setuptools import setup, find_packages

setup(
    name="my_package",
    version="0.1.0",
    packages=find_packages(where="src"),
    package_dir={"": "src"},
    description="A description of your package",
    long_description=open("README.md", encoding="utf-8").read(),
    long_description_content_type="text/markdown",
    author="Your Name",
    author_email="your.email@example.com",
    url="https://github.com/yourusername/my_package",
    license="MIT",
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires=">=3.6",
    install_requires=[
        # Add your dependencies here
    ],
)
```
### 3. Generate Distribution Files
Use setuptools and wheel to create source and binary distributions:

```bash
pip install setuptools wheel
python setup.py sdist bdist_wheel
```
This will create a dist/ directory containing .tar.gz and .whl files

### 4. Test Your Package Locally
Use pip to install the package locally and verify that it works:
``` bash	
pip install dist/my_package-0.1.0-py3-none-any.whl
```


### 5. Upload to TestPyPI (Optional)
Before uploading to the main PyPI, you can test with TestPyPI:
```bash
pip install twine
twine upload --repository-url https://test.pypi.org/legacy/ dist/*
```
Install your package from TestPyPI for testing:
```bash
pip install --index-url https://test.pypi.org/simple/ my_package
```


### 6. Upload to PyPI
When you’re ready to upload your package to the main PyPI:
```bash
twine upload dist/*
```
You will be prompted to enter your PyPI username and password. Once authenticated, your package will be uploaded.

### 7. Verify Your Package
Go to PyPI and search for your package. You can also test installation with:
```bash
pip install my_package
```


### Common Tips:
- Versioning: Increment the version number in setup.py whenever you upload a new version.
- License: Ensure you include a LICENSE file for open-source projects.
- README: Use a well-written README.md to document your package.
- Dependencies: Clearly define dependencies in install_requires within setup.py.

That’s it! You’ve successfully published a Python package to PyPI.
reach out if you have any questions or need further assistance :wink:
