# Mesh
A bridge between Ruby and the CLR.

## Overview
Mesh exposes CLR objects to the Ruby runtime as Ruby objects.

## Goals

## Interface

psobject = Mesh::Powershell.GetObject("blah")

dotnetobject = Mesh::GetObject("blah")

dotnetobject.mymethod(blah, blah)
dotnetobject.mymethodtyped(typehash, blah, blah)



## Architecture


## Implementation notes

