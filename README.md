# Mesh
A bridge between Ruby and the CLR.

## Overview
The Mesh library exposes CLR objects to the Ruby runtime as Ruby objects.

## Goals
* Provide access to advanced Windows-specific functionality for system administrators
  and other power users
* Boost the productivity in Ruby of users already familiar with the CLR / .NET
  Framework (.NET).

## Sample usage (prototype)

psobject = Mesh::Powershell.GetObject("blah")

dotnetobject = Mesh::GetObject("blah")

dotnetobject.mymethod(blah, blah)
dotnetobject.mymethodtyped(typehash, blah, blah)

## Architecture

## Improvements

