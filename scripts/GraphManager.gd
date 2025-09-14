extends Node3D

# Dictionary to store nodes and edges
var nodes = {}
var edges = []

# Function to add a node
func add_node(id, position):
	var node = MeshInstance3D.new()
	node.mesh = SphereMesh.new()
	node.transform.origin = position
	add_child(node)
	nodes[id] = node

# Function to add an edge
func add_edge(start_id, end_id):
	if start_id in nodes and end_id in nodes:
		var edge = ImmediateMesh.new()
		var surface_tool = SurfaceTool.new()
		surface_tool.begin(Mesh.PRIMITIVE_LINES)
		surface_tool.add_vertex(nodes[start_id].transform.origin)
		surface_tool.add_vertex(nodes[end_id].transform.origin)
		surface_tool.commit(edge)
		add_child(edge)
		edges.append(edge)

# Function to clear the graph
func clear_graph():
	for node in nodes.values():
		node.queue_free()
	for edge in edges:
		edge.queue_free()
	nodes.clear()
	edges.clear()
