try:
    from setuptools import setup
except ImportError:
    from distutils.core import setup

config = {
    'description': 'Some project. The name might be indicative of its' +
    ' purpose, but I havent written a proper description yet.',
    'author': 'Alexander Reitzel',
    'url': 'http://funtimecoding.org',
    'download_url': 'http://funtimecoding.org/download/projectname.tar.gz',
    'author_email': 'funtimecoding@gmail.com',
    'version': '0.1',
    'install_requires': ['nose2'],
    'packages': ['NAME'],
    'scripts': [],
    'name': 'projectname'
}

setup(**config)
