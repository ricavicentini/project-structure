#!/bin/bash
# WARNING: This script is under construction and not ready for use.
# Please do not execute until further notice!

# Check if a name argument was provided
if [ -z "$1" ]; then
    echo "Usage: $0 structure_name"
    exit 1
fi

# Structure name
STRUCTURE_NAME=$1

# Create the directory structure and files
mkdir -p $STRUCTURE_NAME/src
touch $STRUCTURE_NAME/src/__init__.py

# Add library code to core.py
cat <<EOL > $STRUCTURE_NAME/src/core.py
# $STRUCTURE_NAME/src/core.py
def hello_world():
    return "Hello, world!"
EOL

mkdir -p $STRUCTURE_NAME/tests

# Add a basic test in test_core.py
cat <<EOL > $STRUCTURE_NAME/tests/test_core.py
import pytest
import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'src')))
from core import hello_world

def test_hello_world():
    assert hello_world() == "Hello, world!"
EOL

# Create setup.py for package configuration
cat <<EOL > $STRUCTURE_NAME/setup.py
from setuptools import setup, find_packages
with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()
setup(
    name='${STRUCTURE_NAME}-package',
    version='1.0.0',
    packages=find_packages(where="src"),
    package_dir={"": "src"},
    description='Description of your library ${STRUCTURE_NAME}',
    author='your name',
    author_email='your.email@example.com',
    url='https://github.com/tadrianonet/${STRUCTURE_NAME}',  
    license='MIT',  
    long_description=long_description,
    long_description_content_type='text/markdown'
)
EOL

# Create README.md with basic instructions
cat <<EOL > $STRUCTURE_NAME/README.md
# ${STRUCTURE_NAME^}
A simple example library.
## Installation
\`\`\`sh
pip install ${STRUCTURE_NAME}
\`\`\`
## Usage
\`\`\`python
from core import hello_world
print(hello_world())
\`\`\`
EOL

echo "Structure $STRUCTURE_NAME created successfully!"