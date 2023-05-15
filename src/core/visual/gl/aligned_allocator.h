 

#ifndef __ALIGNED_ALLOCATOR_H__
#define __ALIGNED_ALLOCATOR_H__

// #include <intrin.h>
#if defined(__MACH__)
#include <stdlib.h>
#else
#include <malloc.h>	// _aligned_malloc and _aligned_free
#endif
#include <memory>		// std::allocator


// #if defined( _M_IX86 ) || defined( _M_X64 )
// STL allocator
template< class T, int TAlign=16 >
struct aligned_allocator : public std::allocator<T>
{
    typedef size_t	size_type;
    typedef T*		pointer;
	static const int ALIGN_SIZE = TAlign;
	template <class U> struct rebind    { typedef aligned_allocator<U,TAlign> other; };
	aligned_allocator() throw() {}
	aligned_allocator(const aligned_allocator&) throw () {}
	template <class U> aligned_allocator(const aligned_allocator<U, TAlign>&) throw() {}
	template <class U> aligned_allocator& operator=(const aligned_allocator<U, TAlign>&) throw()  {}
	// allocate
	pointer allocate(size_type c, const void* hint = 0) {
        #if defined(__MACH__)
        // https://stackoverflow.com/questions/11765300/how-to-wrap-posix-memalign-to-compile-an-old-codebase-on-mac
        void *result=0;
        posix_memalign(&result, sizeof(T)*c, TAlign);
        return static_cast<pointer>(result);
        #else
        return static_cast<pointer>( ::memalign( sizeof(T)*c, TAlign ) );
        #endif
	}
	// deallocate
	void deallocate(pointer p, size_type n) {
		::free( p );
	}
};


#endif // __ALIGNED_ALLOCATOR_H__
