#ifndef CAMERA_HPP
#define CAMERA_HPP

#include "common.hpp"

enum MoveDirection
{
    FORWARD,
    BACKWARD,
    RIGHT,
    LEFT,
    UP,
    DOWN
};

class Camera
{
public:
    // camera status
    vec3 position;
    vec3 front;
    vec3 top;
    vec3 right;
    // perspective status
    float fieldOfView;
    float aspect;
    float near;
    float far;
    // move parameter
    float moveSpeed;
    // trackball parameter
    float trackballSpeed;
    float theta;
    float phi;

    Camera()
    {
        position       = vec3(0.0f, 0.0f, 0.0f);
        front          = vec3(1.0f, 0.0f, 0.0f);
        top            = vec3(0.0f, 1.0f, 0.0f);
        right          = vec3(0.0f, 0.0f, 1.0f);
        fieldOfView    = 60.0f;
        aspect         = (float)INIT_WIDTH / (float)INIT_HEIGHT;
        near           = 0.1f;
        far            = 1000.0f;
        moveSpeed      = 10.0f;
        trackballSpeed = 0.1f;
        theta          = 0.0f;
        phi            = 0.0f;
    }

    Camera& withPosition(vec3 val)
    {
        position = val;
        return *this;
    }

    Camera& withFieldOfView(float val)
    {
        fieldOfView = val;
        return *this;
    }

    Camera& withAspect(float val)
    {
        aspect = val;
        return *this;
    }

    Camera& withNear(float val)
    {
        near = val;
        return *this;
    }

    Camera& withFar(float val)
    {
        far = val;
        return *this;
    }

    Camera& withMoveSpeed(float val)
    {
        moveSpeed = val;
        return *this;
    }

    Camera& withTrackballSpeed(float val)
    {
        trackballSpeed = val;
        return *this;
    }

    Camera& withTheta(float val)
    {
        theta = val;
        updateCameraStatus();
        return *this;
    }
    Camera& withPhi(float val)
    {
        if (val < 85 && val> -85)
            phi = val;
        updateCameraStatus();
        return *this;
    }

    mat4 getPerspective()
    {
        return perspective(radians(fieldOfView), aspect, near, far);
    }

    mat4 getView()
    {
        // cout << "DEBUG::MAIN::C-CAMERA-F-GV: " << position.x << " " << position.y << " " << position.z << endl;
        // cout << "DEBUG::MAIN::C-CAMERA-F-GV: " << front.x << " " << front.y << " " << front.z << endl;
        return lookAt(position, position + front, top);
    }

    void processMove(MoveDirection moveDirction, float timeDifferent)
    {
        float shift = moveSpeed * timeDifferent;
        // cout << "DEBUG::CAMERA::C-CAMERA-F-PM-1: " << shift << endl;
        if (moveDirction == FORWARD)
            position += vec3(front.x, 0, front.z) * shift;
        if (moveDirction == BACKWARD)
            position -= vec3(front.x, 0, front.z) * shift;
        if (moveDirction == LEFT)
        {
            theta -= shift * 2.5;
            updateCameraStatus();
        }
        if (moveDirction == RIGHT)
        {
            theta += shift * 2.5;
            updateCameraStatus();
        }
        if (moveDirction == UP)
            position += vec3(0.0f, 1.0f, 0.0f) * shift;
        if (moveDirction == DOWN)
            position -= vec3(0.0f, 1.0f, 0.0f) * shift;
        // cout << "DEBUG::CAMERA::C-CAMERA-F-PM-2: " << position. x << " " << position.y << " " << position.z << endl;
    }

    void processTrackball(float thetaDifferent, float phiDifferent)
    {
        // cout << "DEBUG::CAMERA::F-PT-1: " << thetaDifferent << " " << phiDifferent << endl;
        theta -= thetaDifferent * trackballSpeed;
        float newPhi = phi + phiDifferent * trackballSpeed;
        if (newPhi < 85 && newPhi> -85)
            phi = newPhi;
        updateCameraStatus();
    };

private:
    void updateCameraStatus()
    {
        // cout << "DEBUG::CAMERA::UCS: " << sin(radians(theta)) << " " << cos(radians(phi)) << endl;
        front.x = cos(radians(theta)) * cos(radians(phi));
        front.y = sin(radians(phi));
        front.z = sin(radians(theta)) * cos(radians(phi));
        front = normalize(front);

        right = normalize(cross(front, vec3(0.0f, 1.0f, 0.0f)));
        top = normalize(cross(right, front));
    }
    
};


#endif
