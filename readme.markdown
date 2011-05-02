# **Particle**: a quick physics sim using Lua and Love2d

This sim is my attempt to follow the blog post ["Physics Engines for Dummies"][1] by Paul Firth. Right now all it does is to spawn off 20 particles and move them around a window. Future enhancements will be to use vectors, normals, gravity, etc.

My problem right now is with calculation of distance. In Firth's examples, he assumes all coordinates have a center of zero, and a distance of one to the edge. But I'm in Love2d, where the coordinate system (like that of SDL) is zero at the edge... Come to think of it, where is the #$#&*! edge? I officially hate the documentation for Love2d...

[1]: http://www.wildbunny.co.uk/blog/2011/04/06/physics-engines-for-dummies/ "Physics Engines for Dummies"
