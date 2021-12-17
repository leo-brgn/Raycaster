#ifndef SPHERE_H
#define SPHERE_H

#include "../hitable.h"
#include "../Materials/material.h"

class sphere : public hitable {
public:
    sphere() {}

    sphere(vec3 cen, double r, material *m) : center(cen), radius(r), mat_ptr(m) {}

    virtual bool hit(const ray &r, double tmin, double tmax, hit_record &rec) const;

    vec3 center;
    double radius;
    material *mat_ptr;
};

#endif //SPHERE_H
