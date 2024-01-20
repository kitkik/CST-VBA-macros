struct position { public double x; public double y; public double z; }
struct node_ind{ public uint id1; public uint id2; public uint id3; }

private void getCoords()
{
BinaryReader br = new BinaryReader(new FileStream("D:/CST/Result/e-field (f=1;z=9000)_ffs1(1,0).slim", FileMode.Open));           
char[] header = br.ReadChars(266); // total number of chars from the "SLIM" word to the "end" word in a *.slim file.
uint node = 3721; // total number of nodes from the header of a *.slim file.
uint triangle = 7200; // total number of triangles from the header of a *.slim file.
int[] node_id = new int[node];
int[] triangle_id = new int[triangle];
position[] node_position = new position[node];
node_ind[] node_index = new node_ind[triangle];
           
for (int i = 0; i < node; i++)
{
    node_position[i].x = br.ReadDouble();                
    node_position[i].y = br.ReadDouble();
    node_position[i].z = br.ReadDouble();
    node_id[i] = br.ReadInt32();
}
for (int i = 0; i < triangle; i++)
{
    node_index[i].id1 = br.ReadUInt32();
    node_index[i].id2 = br.ReadUInt32();
    node_index[i].id3 = br.ReadUInt32();
    triangle_id[i] = br.ReadInt32();
}           

using (StreamWriter file = new StreamWriter("D:/CST/coords.txt", false))
{               
    foreach (var index in node_index)
    {
        file.WriteLine(node_position[index.id1].x + " " + node_position[index.id1].y + " " + node_position[index.id1].z);
        file.WriteLine(node_position[index.id2].x + " " + node_position[index.id2].y + " " + node_position[index.id2].z);
        file.WriteLine(node_position[index.id3].x + " " + node_position[index.id3].y + " " + node_position[index.id3].z);
    }
    file.Close();
}
}
