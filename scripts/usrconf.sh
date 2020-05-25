#!/bin/bash
set -e

adduser rstudio sudo && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
