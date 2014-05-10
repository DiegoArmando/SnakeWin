/* Syntax: draw_arc(cx, cy, r, startangle, endangle, w, color) */
var cx,cy,r,start,finish,angle,w, color;
cx=argument0;
cy=argument1;
r=argument2;
start=min(argument3, argument4);
finish=max(argument3, argument4);
w=argument5;
color=argument6;

draw_primitive_begin(pr_trianglestrip);
for (angle=start; angle<finish; angle+=5) {
  draw_vertex_color(cx+lengthdir_x(r, angle), cy+lengthdir_y(r, angle), color, 1);
  draw_vertex_color(cx+lengthdir_x(r-w, angle), cy+lengthdir_y(r-w, angle), color, 1);
}
draw_primitive_end();

color=merge_color(color, c_black, 0.5);
draw_line_color(cx+lengthdir_x(r-w, start), cy+lengthdir_y(r-w, start), cx+lengthdir_x(r, start), cy+lengthdir_y(r, start), color, color);
draw_line_color(cx+lengthdir_x(r-w, finish), cy+lengthdir_y(r-w, finish), cx+lengthdir_x(r, finish), cy+lengthdir_y(r, finish), color, color);

draw_primitive_begin(pr_linestrip);
for (angle=start; angle<finish; angle+=5) {
  draw_vertex_color(cx+lengthdir_x(r, angle), cy+lengthdir_y(r, angle), color, 1);
}
draw_primitive_end();
