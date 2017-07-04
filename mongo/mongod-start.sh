#!/bin/bash
 
# Created by Andrew Dalkos on
# 07/04/2017 for Dalkoscout
# - Start MongoD, even after crash without journaling enabled

if [ -f /data/db/mongod.lock ]; then
    # Repair database
    /opt/mongodb/bin/mongod --dbpath /data/db --repair
    if [ $? -ne 0 ]; then
        # Exit if repair failed
        echo "FAILED TO REPAIR THE MONGO DATABASE"
        exit 2
    else
        # Try to run MongoD after successful repair
        /opt/mongodb/bin/mongod || exit 1
    fi
else
    # Run MongoD
    /opt/mongodb/bin/mongod || exit 1
fi