#!/usr/bin/python3

class Hero:
    def __init__(self,id,name):
        self.id   = id
        self.name = name

    def serialize(self):
        return {
            'id': self.id, 
            'name': self.name,
        }
