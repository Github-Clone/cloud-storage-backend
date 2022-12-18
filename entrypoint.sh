#!/bin/bash

echo 'yes' | python manage.py migrate && python manage.py runscripts