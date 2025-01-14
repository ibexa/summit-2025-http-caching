<?php

namespace App\Controller;

use Ibexa\Contracts\Core\Repository\ContentService;
use Ibexa\Contracts\Core\Repository\Exceptions\NotFoundException;
use Ibexa\Contracts\Core\Repository\Exceptions\UnauthorizedException;
use Ibexa\Contracts\Core\Repository\LocationService;
use Ibexa\Contracts\Core\Repository\Repository;
use Ibexa\Contracts\Core\SiteAccess\ConfigResolverInterface;
use Ibexa\Contracts\HttpCache\ResponseTagger\ResponseTagger;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CustomController extends AbstractController
{
    private ContentService $contentService;

    private LocationService $locationService;
    private ResponseTagger $responseTagger;
    private ConfigResolverInterface $configResolver;
    private Repository $repository;

    public function __construct(
        ContentService $contentService,
        LocationService $locationService,
        ResponseTagger $responseTagger,
        Repository $repository,
        ConfigResolverInterface $configResolver
    ) {
        $this->contentService = $contentService;
        $this->locationService = $locationService;
        $this->responseTagger = $responseTagger;
        $this->configResolver = $configResolver;
        $this->repository = $repository;
    }


    /**
     * http://localhost:8080/custom/helloworld
     *
     * @Route ("/custom/helloworld")
     * @param Request $request
     * @return Response
     */
    public function helloWorld(Request $request)
    {
        return new Response("Hello world");
    }

    /**
     * http://localhost:8080/custom/taginphp
     *
     * @Route ("/custom/taginphp")
     * @param Request $request
     * @return Response
     * @throws NotFoundException
     * @throws UnauthorizedException
     */
    public function tagInPHP(Request $request)
    {
        $location = $this->locationService->loadLocation(2);
        $content = $location->getContent();

        // Adds tags: c52 ct42 l2
        // Adds tags: pl1 p1 p2

        $response = new Response("Name for content with location id 2 = " . $content->getName());

        return $response;
    }

    /**
     * http://localhost:8080/custom/tagintwig
     *
     * @Route ("/custom/tagintwig")
     * @param Request $request
     * @return Response
     * @throws NotFoundException
     * @throws UnauthorizedException
     */
    public function tagInTwig(Request $request)
    {
        $location = $this->locationService->loadLocation(2);
        $content = $location->getContent();

        $response = $this->render(
            '@ibexadesign/tagintwig.html.twig',
            [
                'location' => $location,
                'content' => $content
            ]
        );
        $response->setSharedMaxAge($this->configResolver->getParameter('content.default_ttl'));

        return $response;
    }

    /**
     * http://localhost:8080/custom/pagewithesi
     *
     * @Route ("/custom/pagewithesi")
     * @param Request $request
     * @return Response
     * @throws NotFoundException
     * @throws UnauthorizedException
     */
    public function pageWithEsi(Request $request)
    {
        $location = $this->locationService->loadLocation(2);
        $content = $location->getContent();
        $this->responseTagger->tag($content->contentInfo);
        $this->responseTagger->tag($location);

        $response = $this->render(
            '@ibexadesign/pagewithesi.html.twig',
            [
                'location' => $location,
                'content' => $content
            ]
        );
        $response->setSharedMaxAge($this->configResolver->getParameter('content.default_ttl'));

        return $response;
    }

    /**
     * http://localhost:8080/custom/showcurrentuser
     *
     * @Route ("/custom/showcurrentuser")
     * @param Request $request
     * @return Response
     * @throws NotFoundException
     * @throws UnauthorizedException
     */
    public function showCurrentUser(Request $request)
    {
        usleep(250000);
        $user = $this->getUser();
        if ($user === null) {
            $currentUser = $this->repository->sudo(function (Repository $repository) {
                // Anonymous has Content Id 10
                return $repository->getContentService()->loadContent(10);
            });
            $currentUserName = $currentUser->getName();
        } else {
            /** @var $currentUser \Ibexa\Contracts\Core\Repository\Values\User\User */
            $currentUser = $this->getUser()->getAPIUser();
            $currentUserName = $currentUser->getName();
        }
        $this->responseTagger->tag($currentUser->contentInfo);

        $response = new Response("Current logged in user : $currentUserName<br/>\n");
        //$response->setSharedMaxAge($this->configResolver->getParameter('content.default_ttl'));
        //$response->setVary('Cookie', false);

        return $response;
    }
}