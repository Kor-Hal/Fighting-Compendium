#!/usr/bin/python
# -*- coding: iso-8859-1 -*-

import tkinter as tk
from tkinter import ttk
import os, inspect, sys
from PIL import Image, ImageTk

from packages import engine

class Interface(ttk.Frame):
    
  """Main window.
  All widgets are stored as attributes to it."""
  
  _tree = None
  
  _app_engine = None
  
  def __init__(self, application, **kwargs):
    ttk.Frame.__init__(self, application, width=768, height=576, **kwargs)
    
    # Declaring the engine
    self._app_engine = engine.Engine()
    
    self._tree = ttk.Treeview(self)
    
    # Inserted at the root, program chooses id:
    self._tree.insert('', 'end', 'widgets', text='Widget Tour')
     
    # Same thing, but inserted as first child:
    self._tree.insert('', 0, 'gallery', text='Applications')

    # Treeview chooses the id:
    id = self._tree.insert('', 'end', text='Tutorial')

    # Inserted underneath an existing node:
    self._tree.insert('widgets', 'end', text='Canvas')
    self._tree.insert(id, 'end', text='Tree')
    
    tempImage = Image.open(os.path.join(os.path.dirname(sys.argv[0]),'images','Untitled.png'))
    untitled = ImageTk.PhotoImage(tempImage)
    self._tree.insert('', 'end', image=untitled, text='image')

    self.grid(column=0, row=0)
    self._tree.grid(column=0, row=0)
    