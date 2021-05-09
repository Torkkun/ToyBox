#TODO write a description for this script
#@author 
#@category _NEW_
#@keybinding 
#@menupath 
#@toolbar 


#TODO Add User Code Here
count=0
dede=[]
enc = getBytes(toAddr(0x00102010), 0xec)
"""for i in enc:
    if(i!=0):
        count += 1"""
        
for i in range(len(enc)):
    if(enc[i] != 0):
        dede.append((enc[i] ^ 0xff) & 0x22 | enc[i] & 0xdd)


print(''.join([chr(a) for a in dede]))
        

