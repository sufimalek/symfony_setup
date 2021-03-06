<?php
// src/AppBundle/Entity/User.php

namespace AppBundle\Entity;

use FOS\UserBundle\Entity\User as BaseUser;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="user")
 */
class User extends BaseUser
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    public function __construct() {

        parent::__construct();
    }

    /**
     * @param $role
     */
    public function setRole($role) {

        $this->setRoles(array($role));
    }

    /**
     * @return mixed
     */
    public function getRole() {
        if(isset($this->roles[0]))
        {
            $role = $this->roles[0];
            return $role;
        }
        return "DUMMY";
    }
}
