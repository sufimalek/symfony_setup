<?php
// src/AppBundle/Form/RegistrationType.php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;

class SearchGiveawayType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name', 'text', array())
            ->add('price', 'choice', array(
                'label' => 'Role',
                'multiple' => false,
                'choices'  => array(
                    '0' => 'Price low to high',
                    '1' => 'Price high to low',
                )))
            ->add('search', 'submit');
    }

    public function getName()
    {
        return 'app_search_giveaway_form';
    }
}
