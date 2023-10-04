// -*- C++ -*-

/*

  Heap Layers: An Extensible Memory Allocation Infrastructure
  
  Copyright (C) 2000-2003 by Emery Berger
  http://www.cs.umass.edu/~emery
  emery@cs.umass.edu
  
  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation; either version 2 of the License, or
  (at your option) any later version.
  
  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.
  
  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

*/

#ifndef _LEAMALLOCHEAP_H_
#define _LEAMALLOCHEAP_H_

#include <cstdlib>

/**
 * @class LeaMallocHeap
 * @brief A "source heap" that uses the Lea allocator.
 */

extern "C" void * dlmalloc (size_t);
extern "C" void   dlfree (void *);
extern "C" size_t dlmalloc_usable_size (void *);

namespace HL {

class LeaMallocHeap {
 public:
  inline void * malloc (size_t sz) {
    void * ptr = dlmalloc (sz);
    return ptr;
  }

  inline void free (void * p) {
    dlfree (p);
  }

  inline size_t getSize (const void * p) {
    return dlmalloc_usable_size ((void *) p);
  }
};

};

#endif
