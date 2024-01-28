#include <iostream>
#include <vector>
#include <string>

using namespace std;

int main()
{
    string msg[] = {"Hello", "C++", "World", "from", "VS Code", "and the C++ extension!"};
    int n = sizeof(msg)/sizeof(msg[0]);
    for (int i=0; i < n; i++)
    {
        cout << msg[i] << " ";
    }
    cout << endl;
}

/*

Notes: How does this code work?

int n = sizeof(msg)/sizeof(msg[0]);

Answer: sizeof(msg) gives the number of bytes in the array.


An object of type std::string has a size, the size is independent of the content of the string.
The way that C++ implements std::string for strings of unbounded length is to use a pointer to each string object in the array. 
The pointer points to the first byte of the string.
sizeof(std::string) is the size of this pointer plus other data that the std::string type keeps track of the class table. 
It has no relation with the length of the individual string.

Because An array is an object which consists of several objects of the same type, the elements all have the same size.

*/