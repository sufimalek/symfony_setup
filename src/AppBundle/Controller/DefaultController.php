<?php

namespace AppBundle\Controller;

use AppBundle\Form\SearchGiveawayType;
use AppBundle\Entity\Giveaway;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        return $this->render('AppBundle::layout.html.twig');
    }

    /**
     * @Route("/search", name="search")
     */
    public function searchGiveawayAction(Request $request) {



        $giveaway = new Giveaway();

        $form = $this->createForm(new SearchGiveawayType(), $giveaway);

        $form->handleRequest($request);
        $result = array();
        if ($form->isValid()) {

            $session = $this->getRequest()->getSession();
            $session->getFlashBag()->add('message', 'Article saved!');

            //Query
            $repo = $this->getDoctrine()->getRepository('AppBundle:Giveaway');
            $data = $form->getData();
            $name = $data->getName();
            $sortType = $data->getPrice();
            $result = $repo->getGiveaways($name, ($this->getUser()->hasRole('ROLE_ADMIN')) ? array(1,0) : array(0), $sortType );

        }

        return $this->render('AppBundle::Default/searchGiveaway.html.twig', array('form' => $form->createView(), 'result'=>$result));

    }
}
