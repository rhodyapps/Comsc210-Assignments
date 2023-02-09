#include<iostream>
#include<string>

/* 

E_n(x)=(x+n)mod\ 26           
(Encryption Phase with shift n)

D_n(x)=(x-n)mod\ 26           
(Decryption Phase with shift n)
*/

using namespace std;
int main(){
    int i,j,k;
    string s,t;
    int key;
    cout<<"\nEnter the key: ";
    cin>>key;
    cout<<"\nEnter the message: ";
    cin>>s;
    for(i=0;i<s.size();i++){
        t+=(s[i]-'A'+key)%26+'A';
    }
    cout<<"\n\nEncrypted message: "<<t<<'\n';
    return 0;
}
