'#Language "WWB-COM"

Option Explicit

Sub Main
	Dim m As Long, nx As Long, ny As Long, nz As Long, xre As Double, yre As Double, zre As Double, xim As Double, yim As Double, zim As Double, dNode As Double


Dim res1 As Object
Set res1 = Result3D("D:\CST\Result\e-field (f=1;z=9000)_ffs1(1,0).sct")
m = res1.GetLength
Open "D:\CST macros\efield.txt" For Output As #1
For dNode = 0 To m-1 STEP 1
	res1.GetDataFromIndex(dNode, xre, yre, zre, xim, yim, zim)
	Print #1, CStr(dNode) + " " +  CStr(xre) + " " + CStr(xim) + " " + CStr(yre)+ " " + CStr(yim)+ " " + CStr(zre)+ " " + CStr(zim)
Next dNode
Close #1
Beep
End Sub
