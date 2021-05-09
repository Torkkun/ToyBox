#TODO write a description for this script
#@author 
#@category _NEW_
#@keybinding 
#@menupath 
#@toolbar 


#TODO Add User Code Here
def de(inst):
    for _ in range(2):
        e = inst.getDefaultOperandRepresentation(1)
        for i in range(len(e)-1,2,-2):
            enc.append(int((e[i-1]+e[i]),16))
            #print(enc)
            
        inst = inst.getNext()

enc = []
addr = toAddr(0x10001b)
de(getInstructionAt(addr))
addr = toAddr(0x100037)
de(getInstructionAt(addr))

        
print(''.join([chr(a) for a in enc]))
