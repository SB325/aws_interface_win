#!/bin/bash

source ec2_ids.sh

if "$1"=="" (
    echo "No parameters have been provided."
    echo "Please add \"stock\" as argument"
    )
fi

if "%0"=="stock" (
    echo "Starting stock EC2 Instance"
    instance="i-0318bdd3d94e05756"
    )
fi

if "%instance%"=="$stock_ec2_id" (
    echo "The instance id $instance is empty! Exiting."
    ) else (
    echo "The instance id $instance ($0) is starting!"
    aws ssm start-session --target $instance
    )
fi

